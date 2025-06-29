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
    platforms = models.ManyToManyField('Platform', verbose_name="Platforms")
    genres = models.ManyToManyField('Genre', verbose_name="Genres")
    description = models.TextField(blank=True, verbose_name="Description")

    photo = models.ImageField(
        upload_to='game_photos/',
        blank=True,
        null=True,
        verbose_name="Game Photo"
    )
    owner = models.ForeignKey(
        'Player',
        on_delete=models.CASCADE,
        related_name='games',
        verbose_name="Owner",
        blank=True,
        null=True,
    )

    class Meta:
        verbose_name = "Game"
        verbose_name_plural = "Games"
        ordering = ['title']
    
    def __str__(self):
        return self.title



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

class Player(models.Model):
    username = models.CharField(max_length=50, unique=True, verbose_name="Username")
    email = models.EmailField(unique=True, verbose_name="Email")
    password = models.CharField(max_length=100, verbose_name="Password")

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "Player"
        verbose_name_plural = "Players"