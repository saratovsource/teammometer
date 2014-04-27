module Concerns
  module Pagination
    def paginate_params
      {
        page: params.fetch(:page, 1).to_i,
        per_page: params.fetch(:per_page, 30).to_i
      }
    end
  end
end
