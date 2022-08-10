require 'diary'
require 'diary_entry'

RSpec.describe "Diary Integration" do
    context "after adding some entries" do
        it "gets all diary entries" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("First Entry", "I love summer")
            entry_2 = DiaryEntry.new("Second Entry", "I love programming")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.all()).to eq [entry_1, entry_2]
        end

        describe "word counting behaviour" do
            it "counts the words in all diary entries" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("First Entry", "I love summer")
                entry_2 = DiaryEntry.new("Second Entry", "I love programming")
                diary.add(entry_1)
                diary.add(entry_2)  
                expect(diary.count_words).to eq 6
            end
    end

    describe "reading time behaviour" do
        it 'fails where wpm is 0' do
            diary = Diary.new
            entry_1 = DiaryEntry.new("First Entry", "I Love summer")
            diary.add(entry_1)
            expect { diary.reading_time(0) }.to raise_error "WPM must be positive."
        end

        it "calculates the reading time for all entries where it fits exactly" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("First Entry", "I Love summer")
            entry_2 = DiaryEntry.new("Second Entry", "I love programming")
            diary.add(entry_1)
            diary.add(entry_2)  
            expect(diary.reading_time(2)).to eq 3
        end

        it "calculates the reading time for all entries where it doesn't fit exactly" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("First Entry", "Love summer")
            entry_2 = DiaryEntry.new("Second Entry", "I love programming")
            diary.add(entry_1)
            diary.add(entry_2)  
            expect(diary.reading_time(2)).to eq 3
        end
end
end
end