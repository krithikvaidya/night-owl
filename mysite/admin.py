
from django.contrib.admin import AdminSite


class CustomAdminSite(AdminSite):
    # set values for `site_header`, `site_title`, `index_title` etc.
    site_header = 'Custom Admin Site'
    ...

    # extend / override admin views, such as `index()`
    def index(self, request, extra_context=None):
        extra_context = extra_context or {}

        # do whatever you want to do and save the values in `extra_context`
        extra_context['world'] = 'Earth'

        return super(CustomAdminSite, self).index(request, extra_context)


custom_admin_site = CustomAdminSite()