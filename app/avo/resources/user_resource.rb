class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :password, as: :password
  # field :status, as: :select, enum: ::User.statuses
  # field :messages, as: :has_many
  # field :participants, as: :has_many
  # add fields here
end
