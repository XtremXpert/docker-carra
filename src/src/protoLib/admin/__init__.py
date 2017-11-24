# -*- coding: utf-8 -*-

from django.contrib  import admin
# from reversion.helpers import patch_admin
# import reversion


# -----------------------------------------   AddUser  

from django.contrib.auth.models import User, Group 
from protoExt.admin import UserProfileAdmin
# patch_admin(User)
# patch_admin(Group)

from protoExt.actions import doAddUser, doAddUsers 

try: 
    admin.site.unregister( User ) 
except: 
    pass 

admin.site.register( User, UserProfileAdmin )


# -----------------------------------------   AddUser  

# from protoLib.models import UserProfile
# admin.site.register( UserProfile )
# patch_admin(UserProfile)

# -----------------------------------------     


from protoLib.models import TeamHierarchy
admin.site.register(TeamHierarchy)
# patch_admin(TeamHierarchy)

 
# -----------------------------------------     

from protoLib.models import EntityMap
admin.site.register(EntityMap)
# patch_admin(EntityMap)


# ----------------   de auth 
# from django.contrib.auth.models import Permission, Message
# admin.site.register( Permission )
# admin.site.register( Message )
 
