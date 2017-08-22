# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rai01ref', '0002_auto_20160428_0958'),
    ]

    operations = [
        migrations.AlterField(
            model_name='artefact',
            name='refArtefact',
            field=models.ForeignKey(to='rai01ref.Artefact', verbose_name='Parent', related_name='ref_set', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='artefactcomposition',
            name='containerArt',
            field=models.ForeignKey(verbose_name='Artefact', related_name='artefactcomposition_set', to='rai01ref.Artefact'),
        ),
        migrations.AlterField(
            model_name='artefactcomposition',
            name='inputArt',
            field=models.ForeignKey(verbose_name='in', related_name='+', to='rai01ref.Artefact'),
        ),
        migrations.AlterField(
            model_name='artefactcomposition',
            name='outputArt',
            field=models.ForeignKey(to='rai01ref.Artefact', verbose_name='out', related_name='+', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='capacity',
            name='refCapacity',
            field=models.ForeignKey(to='rai01ref.Capacity', verbose_name='Parent', related_name='ref_set', null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='doctype',
            name='dtype',
            field=models.CharField(verbose_name='DocType', max_length=200),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='refRequirement',
            field=models.ForeignKey(to='rai01ref.Requirement', verbose_name='Parent', related_name='ref_set', null=True, blank=True),
        ),
    ]
