from import_export import resources
from .models import Example

class ExampleResource(resources.ModelResource):
    class meta:
        model = Example
        skip_unchanged = True
        report_skipped = False
