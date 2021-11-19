from django.contrib import admin
from import_export.admin import ImportExportModelAdmin

# Register your models here.
from .models import ClassSize_1, Revenue, Example

admin.site.register(ClassSize_1)
admin.site.register(Revenue)
admin.site.register(Example)

class ExampleAdmin(ImportExportModelAdmin):
    list_display = ('product', 'quantity')
