from django.contrib import admin
from .models import Game, Platform, Genre, Player

admin.site.register(Game)
admin.site.register(Platform)
admin.site.register(Genre)
admin.site.register(Player)
