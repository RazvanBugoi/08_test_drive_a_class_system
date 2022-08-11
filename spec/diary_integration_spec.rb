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

    describe "best reading time entry behaviour" do
        it "fails where wpm is 0" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("First Entry", "Love summer")  
            diary.add(entry_1)
            expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error("WPM must be positive.")
        end

        context "where we just have one entry and it is readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("First Entry", "Love summer")  
                diary.add(entry_1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq entry_1
            end
        end

        context "where we just have one entry and it is unreadable in the time" do
            it "returns nill" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("First Entry", "Love summer and winter")  
                diary.add(entry_1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
            end
        end

        context "where we more than one entry" do
            it "returns the longest entry the user can read in this time" do
                diary = Diary.new
                best_entry = DiaryEntry.new("my_title", "one two")
                diary.add(DiaryEntry.new("my_title", "one"))
                diary.add(best_entry)
                diary.add(DiaryEntry.new("my_title", "one two three"))
                diary.add(DiaryEntry.new("my_title", "one two three four"))
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq best_entry
            end
        end
    end
end
end