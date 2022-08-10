require 'diary'

RSpec.describe Diary do
    context "initially" do
        it "initially has an empty list of entries" do
            diary = Diary.new
            expect(diary.all).to eq []
        end

        it "has a word count of 0" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
        end
    end
end