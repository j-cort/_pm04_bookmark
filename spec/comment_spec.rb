require 'comment'

describe Comment do
let(:comments) { described_class.all_comments }   

  describe '#all_comments' do

    it 'returns an array of Comment objects' do
      expect(comments.count).to eq 3
      expect(comments[0]).to be_an_instance_of Comment
      expect(comments[1].id).to eq '2'
      expect(comments[2].text).to eq 'informative and conveninent'
      expect(comments[1].bookmark_id).to eq '2'
    end

  end

  describe '#add_comment' do

    it 'user adds a comment to bookmark 1' do
      Comment.add_comment('honey is sweeter than vinegar', 1)
      expect(comments.count).to eq 4
      expect(comments.last.text).to eq 'honey is sweeter than vinegar'
      expect(comments.last.bookmark_id).to eq '1'
    end

  end


  

end