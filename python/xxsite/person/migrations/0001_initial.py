# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('pwd', models.CharField(max_length=32)),
                ('email', models.EmailField(default=b'', max_length=254)),
            ],
            options={
                'db_table': 'person',
            },
            bases=(models.Model,),
        ),
    ]
