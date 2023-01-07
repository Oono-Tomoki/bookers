class BooksController < ApplicationController

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
   if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully created"
    # リダイレクト
   else
      @books = Book.all
      render :index
   end
  end

  def index
    @books = Book.all
     
    @book = Book.new
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit 
    @book = Book.new
    
    @list = Book.find(params[:id])
   
  end

  def update
    @list = Book.find(params[:id])
    @book = Book.new
    if @list.update(book_params)
     redirect_to book_path(@list.id)
     flash[:notice] = "Book was successfully updated"
     
    else
      @book = Book.new
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed"
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

 private# ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
 end