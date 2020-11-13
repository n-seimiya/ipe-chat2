# class Student
#     # 値の保持
#     attr_accessor :name, :japanese, :math, :english
#     # クラス変数
#     @@students = []
#     @@japanese_list = []
#     @@math_list = []
#     @@english_list = []


#     def initialize(name, japanese, math, english)
#         @name = name
#         @japanese = japanese
#         @math = math
#         @english = english
#     end

#     def self.register_student
#         puts "生徒の名前を入力してください"
#         name = gets.chomp
#         puts "国語の点数を入力してください"
#         japanese = gets.to_i
#         puts "数学の点数を入力してください"
#         math = gets.to_i
#         puts "英語の点数を入力してください"
#         english = gets.to_i

#         # Studentクラスのインスタンスを生成
#         @student = Student.new(name, japanese, math, english)
#         # クラス変数の配列studentsに生成したインスタンスを格納
#         @@students << @student
#         # インスタンス生成と同時に、各科目ごとの配列にそれぞれ格納
#         @@japanese_list << @student.japanese
#         @@math_list << @student.math
#         @@english_list << @student.english
#     end

#     def self.show
#         puts "詳細確認をしたい番号を入力してください"
#         @@students.each_with_index do |student, index|
#             puts "[#{ index + 1 }] #{ student.name }"
#         end 
#         input = gets.to_i

#         @@students[input - 1].show_detail
#     end
    
#     def show_detail
#         puts "名前　：　#{@name}"
#         puts "国語　：　#{red_point(@japanese)}点"
#         puts "数学　：　#{red_point(@math)}点"
#         puts "英語　：　#{red_point(@english)}点"
    
#         score_list = [@japanese, @math, @english]
#         puts "平均点：　#{average(score_list)}点"
#     end

#     def red_point(score)
#         score = score <= 30 ? "×　#{score}" : score
#     end

#     def self.ranking
#         total_list = []

#         @@students.each do |student|
#             sum = student.japanese + student.math + student.english
#             total_list << { name: student.name, total: sum }
#         end

#         total_list.sort_by! { |student| -student[:total] }
        
#         puts "総合順位"
#         total_list.each_with_index do |student, index|
#             puts "#{index + 1}位　：　#{student[:total]}点　#{student[:name]}"
#         end

#         puts "平均点"
#         puts "国語　：　#{average(@@japanese_list)}点"
#         puts "数学　：　#{average(@@math_list)}点"
#         puts "英語　：　#{average(@@english_list)}点"
#     end
# end

# def average(score_list)
#     total = score_list.inject(:+)
#     average = total / score_list.length
# end    

# while true do
#     puts "番号を入力してください"
#     puts "[1] 生徒を登録する"
#     puts "[2] 生徒の一覧を見る"
#     puts "[3] 総合順位を見る"
#     puts "[4] アプリを終了する。"
#     input = gets.to_i

#     case input
#     when 1
#         # 生徒を登録する処理
#         Student.register_student
#     when 2
#         # 生徒の一覧を表示する処理
#         Student.show
#     when 3
#         # 総合順位を表示する処理
#         Student.ranking
#     when 4
#         exit
#     end
# end

# 問1. 数当てゲーム
# result = rand(0..9)
# input = ""

# while input != result
#     puts "0～9の数字を入力してください"
#     input = gets.to_i

#     if input == result
#         puts "正解！#{result}でした"
#     elsif input > result
#         puts "#{input}より小さい数字です"
#     else input < result
#         puts "#{input}より大きい数字です"
#     end
# end

# 問2. 3の倍数と3のつく数字の時だけアホになる
# num = 1

# while num <= 50
#     if num % 3 == 0 || num % 10 == 3
#         puts "Aho"
#     else
#         puts num
#     end
#     num += 1
# end

# 問3. レビューアプリの作成

# def register_review(reviews)
#     puts "商品名を入力してください"
#     name = gets.chomp
#     puts "感想を入力してください"
#     impression = gets.chomp

#     reviews << { name: name, impression: impression}
# end

# def show_reviews(reviews)
#     reviews.each do |review|
#         puts "----------------------------"
#         puts "商品名：商品名：#{review[:name]}"
#         puts "　感想：#{review[:impression]}"
#     end
# end

# reviews = []
# while true do
#     puts "番号を入力してください"
#     puts "[1] レビューを登録する"
#     puts "[2] レビューの一覧を見る"
#     puts "[3] アプリを終了する。"

#     input = gets.to_i

#     case input
#     when 1
#         register_review(reviews)
#     when 2
#         show_reviews(reviews)
#     when 3
#         exit
#     end
# end