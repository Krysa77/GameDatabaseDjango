from django.shortcuts import render, get_object_or_404
from .models import Game, Platform, Genre, Player

def index(request):
    context = {
        "game_count": Game.objects.count(),
        "genre_count": Genre.objects.count(),
        "platform_count": Platform.objects.count(),
        "recent_games": Game.objects.order_by('-id')[:5]
    }
    return render(request, "database/index.html", context)

def game_list(request):
    games = Game.objects.all()
    return render(request, "database/game_list.html", {"games": games})

def game_detail(request, game_id):
    game = get_object_or_404(Game, id=game_id)
    return render(request, "database/game_detail.html", {"game": game})
