module Admin
  class OrdersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Order.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def scoped_resource
      Order.placed
    end
  end
end
