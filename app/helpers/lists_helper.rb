module ListsHelper
  def authenticate_same_user
    @list = List.find(params[:id])
      if current_user == @list.user
        true
      else
        redirect_to root_path, :alert => "You are not authorized to edit this event."
      end
  end
end
