from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy
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

class GameUpdateView(UpdateView):
    model = Game
    fields = ['title', 'description', 'release_year', 'photo', 'price', 'platforms', 'genres']
    template_name = 'database/game_edit.html'

    def get_success_url(self):
        return reverse_lazy('game_detail', kwargs={'game_id': self.object.pk})