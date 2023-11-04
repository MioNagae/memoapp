require "csv" #csvファイルを扱うためのライブラリを読み込む

puts "1→新規でメモ帳を作成する / 2→既存のメモを編集する"

memo_type = gets.to_i #ユーザーの入力値を取得し、数字へ変換
#if文を使って続きを書く
if memo_type == 1
  puts"新規メモを作成します。拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  
  puts "入力内容を記入してください。Ctrl＋D で保存します"
  imput_memo = STDIN.read
  memo = imput_memo.chomp
  
  CSV.open("#{file_name}.csv","w") do |csv|
    csv.puts ["#{memo}"]
  end
  
elsif memo_type == 2
  puts "既存のメモを編集します。編集するメモのファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  puts "追記する内容を入力してください。終了後、Ctrl＋Dで保存します"
  memo = STDIN.read
  CSV.open("#{file_name}.csv","a") do |csv|
    csv.puts ["#{memo}"]
  end
  
else
  puts "１か２の数字を入力してください"
end

