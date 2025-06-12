from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from decimal import Decimal

class Game(models.Model):
    title = models.CharField(max_length=100, verbose_name="Game name")
    release_year = models.IntegerField(
        validators=[MinValueValidator(1970), MaxValueValidator(2100)],
        verbose_name="Release year"
    )
    price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name="Price")
    description = models.TextField(blank=True, verbose_name="Description")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Game"
        verbose_name_plural = "Games"
        ordering = ['title']


class Player(models.Model):
    nickname = models.CharField(max_length=50, unique=True, verbose_name="Nickname")
    email = models.EmailField(max_length=100, unique=True, verbose_name="Email")

    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name = "Player"
        verbose_name_plural = "Players"
        ordering = ['nickname']


class Platform(models.Model):
    platform_name = models.CharField(max_length=50, unique=True, verbose_name="Platform")

    def __str__(self):
        return self.platform_name

    class Meta:
        verbose_name = "Platform"
        verbose_name_plural = "Platforms"


class Genre(models.Model):
    genre_name = models.CharField(max_length=50, unique=True, verbose_name="Genre")

    def __str__(self):
        return self.genre_name

    class Meta:
        verbose_name = "Genre"
        verbose_name_plural = "Genres"


class GamePlatform(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    platform = models.ForeignKey(Platform, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('game', 'platform')
        verbose_name = "Game availability on platform"
        verbose_name_plural = "Game availabilities"

    def __str__(self):
        return f"{self.game} on {self.platform}"


class GameGenre(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    genre = models.ForeignKey(Genre, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('game', 'genre')
        verbose_name = "Game genre"
        verbose_name_plural = "Game genres"

    def __str__(self):
        return f"{self.game} - {self.genre}"


class PlayerLibrary(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    acquisition_date = models.DateField(verbose_name="Acquisition date")

    class Meta:
        unique_together = ('player', 'game')
        verbose_name = "Player library"
        verbose_name_plural = "Player libraries"

    def __str__(self):
        return f"{self.player} owns {self.game} since {self.acquisition_date}"
