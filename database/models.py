from django.db import models

class Hra(models.Model):
    id_Hra = models.AutoField(primary_key=True)
    nazev = models.CharField(max_length=45)
    rok_vydani = models.IntegerField()
    cena = models.IntegerField()
    popis = models.CharField(max_length=150)

    def __str__(self):
        return self.nazev

class Hrac(models.Model):
    id_Hrac = models.AutoField(primary_key=True)
    nickname = models.CharField(max_length=45)
    email = models.CharField(max_length=45)

    def __str__(self):
        return self.nickname

class Hra_has_platforma(models.Model):
    Hra_id_Hra = models.IntegerField()
    Platforma_id_Platforma = models.IntegerField()

    def __str__(self):
        return f"Hra ID: {self.Hra_id_Hra}, Platforma ID: {self.Platforma_id_Platforma}"

class Hra_has_zanr(models.Model):
    Hra_id_Hra = models.IntegerField()
    Zanr_id_Zanr = models.IntegerField()

    def __str__(self):
        return f"Hra ID: {self.Hra_id_Hra}, Žánr ID: {self.Zanr_id_Zanr}"

class Knihovna_hrace(models.Model):
    Hra_id_Hra = models.IntegerField()
    Hrac_id_Hrac = models.IntegerField()
    datum_ziskani = models.DateField()

    def __str__(self):
        return f"Hra ID: {self.Hra_id_Hra}, Hráč ID: {self.Hrac_id_Hrac}"

class Platforma(models.Model):
    id_Platforma = models.AutoField(primary_key=True)
    nazev_platformy = models.CharField(max_length=45)

    def __str__(self):
        return self.nazev_platformy
