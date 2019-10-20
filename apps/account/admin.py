from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from account.models import ShutongDept, ShutongUser, ShutongRole, ShutongUserRole

class ShutongDeptAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'parent', 'leader')


class ShutongRoleAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description')


class ShutongUserAdmin(UserAdmin):
    list_display = ('id', 'username', 'email', 'dept', 'is_active', 'is_staff')
    list_display = ('id', 'username', 'alias', 'email', 'phone', 'dept', 'is_active', 'is_staff')
    ordering = ('-id',)
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('username', 'alias', 'email', 'phone','dept')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('date_joined',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2'),
        }),
    )

class ShutongUserRoleAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'role')


admin.site.register(ShutongDept, ShutongDeptAdmin)
admin.site.register(ShutongRole, ShutongRoleAdmin)
admin.site.register(ShutongUser, ShutongUserAdmin)
admin.site.register(ShutongUserRole, ShutongUserRoleAdmin)