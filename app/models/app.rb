class App < ApplicationRecord

  belongs_to :user

  default_scope { order(label: :asc) }

  validates :label, presence: true

  before_create :set_defaults

  def file=(text)
    text.gsub!(user.api_token, '___USER_API_TOKEN___')
    super text
  end

  def file
    text = super
    text.gsub('___USER_API_TOKEN___', user.api_token)
  end


  private

  def set_defaults
    self.file ||=

"\
<!DOCTYPE html>\n\
<html lang=\"en\">\n\
<head>\n\
<meta charset=\"utf-8\">\n\
<title></title>\n\
<script src=\"\"></script>\n\
<link rel=\"stylesheet\" href=\"\">\n\
</head>\n\
<style>\n\
\n\
</style>\n\
<body>\n\
\n\
</body>\n\
<script>\n\
\n\
</script>\n\
</html>"

  end

end
