# Generated by Django 3.0.7 on 2020-06-12 02:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('night_owl', '0004_auto_20200612_0751'),
    ]

    operations = [
        migrations.AlterField(
            model_name='nc1orderdetails',
            name='total_price',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='nc1products',
            name='price',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='nc2orderdetails',
            name='total_price',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='nc2products',
            name='price',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='nc3orderdetails',
            name='total_price',
            field=models.PositiveIntegerField(),
        ),
        migrations.AlterField(
            model_name='nc3products',
            name='price',
            field=models.IntegerField(),
        ),
    ]
