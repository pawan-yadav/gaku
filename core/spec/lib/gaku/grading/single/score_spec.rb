require 'spec_helper_models'

describe Gaku::Grading::Single::Score do

  let(:student) { create(:student) }
  let(:exam) { create(:exam) }
  let(:course) { create(:course) }
  let(:exam_portion1) { create(:exam_portion, exam: exam) }
  let(:exam_portion2) { create(:exam_portion, exam: exam) }
  let(:exam_portion_score1) do
    create(:exam_portion_score, score: 5, student:student, exam_portion: exam_portion1, gradable: course)
  end
  let(:exam_portion_score2) do
    create(:exam_portion_score, score: 10, student:student, exam_portion: exam_portion2, gradable: course)
  end


  subject { described_class.new(exam, student, course) }

  describe 'initialize' do
    it 'initializes with exam' do
      expect(subject.grade_exam).to eq({ id: student.id, score: nil })
    end
  end

  describe 'without exam portion scores' do
    before do
      exam_portion1; exam_portion2
    end
    it 'creates exam_portion_score if not exist' do
      expect do
        subject.grade_exam
      end.to change(student.reload.exam_portion_scores, :count).by(2)
    end
  end

  describe 'with exam portion scores' do

    before do
      exam
      exam_portion1; exam_portion2
      exam_portion_score1;exam_portion_score2
    end

    it "doesn't create exam_portion_score if exists" do
      expect do
        subject.grade_exam
      end.to_not change(student.reload.exam_portion_scores, :count)
    end

    it 'calculates scores from exam_portion_scores' do
      expect(subject.grade_exam).to eq({ id: student.id, score: 15.0 })
    end
  end

end
