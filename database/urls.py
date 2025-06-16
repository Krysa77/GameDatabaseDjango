from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from .views import GameUpdateView

urlpatterns = [
    path('', views.index, name="index"),
    path('games/', views.game_list, name="game_list"),
    path('games/<int:game_id>/', views.game_detail, name="game_detail"),
    path('games/<int:pk>/edit/', GameUpdateView.as_view(), name='game_edit'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
