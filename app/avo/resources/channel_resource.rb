class ChannelResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  groups = ::Channel.groups.dup
  groups.delete(:personal)
  
  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :group, as: :select, enum: groups
  field :participants, as: :has_many
  field :messages, as: :has_many
  # add fields here
end
