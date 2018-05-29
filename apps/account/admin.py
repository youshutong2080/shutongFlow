from django.contrib import admin

from account.models import ShutongDept, ShutongUser, ShutongRole, ShutongUserRole

class ShutongDeptAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'parent', 'leader')


class ShutongRoleAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description')


class ShutongUserAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'email', 'dept', 'is_active', 'is_staff')


class ShutongUserRoleAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'role')


admin.site.register(ShutongDept, ShutongDeptAdmin)
admin.site.register(ShutongRole, ShutongRoleAdmin)
admin.site.register(ShutongUser, ShutongUserAdmin)
admin.site.register(ShutongUserRole, ShutongUserRoleAdmin)