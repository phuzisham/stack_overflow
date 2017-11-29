require 'rails_helper'

describe Question do
  it { should belong_to :user }
  it { should validate_presence_of :question }
  it { should validate_presence_of :category }
  it { should validate_presence_of :user_id }
end
