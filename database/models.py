from django.db import models

class Game(models.Model):
    title = models.CharField(max_length=45)
    release_year = models.IntegerField()
    price = models.IntegerField()
    description = models.CharField(max_length=150)

    def __str__(self):
        return self.title

class Player(models.Model):
    nickname = models.CharField(max_length=45)
    email = models.CharField(max_length=45)

    def __str__(self):
        return self.nickname

class Platform(models.Model):
    platform_name = models.CharField(max_length=45)

    def __str__(self):
        return self.platform_name

class Genre(models.Model):
    genre_name = models.CharField(max_length=45)

    def __str__(self):
        return self.genre_name

class GamePlatform(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    platform = models.ForeignKey(Platform, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.game} on {self.platform}"

class GameGenre(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    genre = models.ForeignKey(Genre, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.game} - {self.genre}"

class PlayerLibrary(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE)
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    acquisition_date = models.DateField()

    def __str__(self):
        return f"{self.player} owns {self.game} since {self.acquisition_date}"
