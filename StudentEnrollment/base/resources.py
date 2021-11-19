from import_export import resources
from .models import Example

class ExampleResource(resources.ModelResource):
    class meta:
        model = Example