from django.contrib import admin
from .models import Game, Player, Platform, Genre, GamePlatform, GameGenre, PlayerLibrary

admin.site.register(Game)
admin.site.register(Player)
admin.site.register(Platform)
admin.site.register(Genre)
admin.site.register(GamePlatform)
admin.site.register(GameGenre)
admin.site.register(PlayerLibrary)
