module DoctorsHelper
  def sort_link(column, title = nil)
    # debugger
    #title || title = column.titleize
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    arrow = sort_direction == "asc" ? "fa fa-angle-up" : "fa fa-angle-down"
    icon = column == sort_column ? arrow : ""
    link_to "#{title} <i class='#{icon}'></i>".html_safe, {column: column, direction: direction}
  end

  ########## IN CASE OF include DoctorsHelper IN CONTROLLER ############
  # def sort_column
  #   # sortable_columns.include?(params[:column]) ? params[:column] : "name"
  #   Doctor.column_names.include?(params[:column]) ? params[:column] : "name"
  # end

  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end
end
