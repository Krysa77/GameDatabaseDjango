from django.contrib import admin
from .models import Hra, Hrac, Hra_has_platforma, Hra_has_zanr, Knihovna_hrace, Platforma

admin.site.register(Hra)
admin.site.register(Hrac)
admin.site.register(Hra_has_platforma)
admin.site.register(Hra_has_zanr)
admin.site.register(Knihovna_hrace)
admin.site.register(Platforma)
