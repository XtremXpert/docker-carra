# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rai01ref', '0003_auto_20170822_1029'),
    ]

    operations = [
        migrations.AlterField(
            model_name='docattribute',
            name='vType',
            field=models.CharField(max_length=75, blank=True, null=True, default='string', choices=[('string', 'string'), ('text', 'text'), ('bool', 'bool'), ('int', 'int'), ('sequence', 'sequence'), ('decimal', 'decimal'), ('money', 'money'), ('combo', 'combo'), ('date', 'date'), ('datetime', 'datetime'), ('time', 'time')]),
        ),
    ]
