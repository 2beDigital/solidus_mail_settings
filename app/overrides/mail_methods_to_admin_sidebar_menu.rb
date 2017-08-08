Deface::Override.new(
    virtual_path: "spree/admin/shared/_settings_sub_menu",
    name: "mail_methods_to_admin_sidebar_menu",
    insert_bottom: "[data-hook='admin_settings_sub_tabs']",
    partial: 'spree/admin/shared/mail_methods_sidebar_menu'
)
