from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Submit

from django import forms
from .models import PaidOrdersNC1, PaidOrdersNC2, PaidOrdersNC3

class CheckoutForm(forms.Form):
    ph_no = forms.IntegerField(label="Phone Number")
    gpay_ph_no = forms.IntegerField(label="Google Pay Phone Number")
    block = forms.ChoiceField(choices=[('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'), ('7', '7'), ('8', '8'),
                                       ('GH-1', 'GH-1'), ('GH-2', 'GH-2'), ('GH-3', 'GH-3'), ('GH-4', 'GH-4'), ('GH-5', 'GH-5'), 
                                       ('MT-1', 'MT-1'), ('MT-2', 'MT-2'), ('MT-3', 'MT-3'), ('MT-4', 'MT-4'),
                                       ('PG-Block', 'PG Block')], label="Block")
    order_comments = forms.CharField(required=False, widget=forms.TextInput(attrs={'placeholder': 'Enter Order Comments (Optional)'}))

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.helper = FormHelper
        self.helper.form_method = 'post'
        
        self.helper.layout = Layout(
            'ph_no',
            'gpay_ph_no',
            'block',
            'order_comments',
            Submit('Submit', 'Submit', css_class='btn-primary')
        )

     