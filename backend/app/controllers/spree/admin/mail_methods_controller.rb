module Spree
  module Admin
    class MailMethodsController < Spree::Admin::BaseController
      def update
        if params[:smtp_password].blank?
          params.delete(:smtp_password)
        end

        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:mail_methods))
        redirect_to edit_admin_mail_method_url
      end

      def testmail
        if TestMailer.test_email(try_spree_current_user.id).deliver
          flash[:success] = Spree.t('admin.mail_methods.testmail.delivery_success')
        else
          flash[:error] = Spree.t('admin.mail_methods.testmail.delivery_error')
        end
      rescue Exception => e
        flash[:error] = Spree.t('admin.mail_methods.testmail.error') % {:e => e}
      ensure
        redirect_to edit_admin_mail_method_url
      end
    end
  end
end
