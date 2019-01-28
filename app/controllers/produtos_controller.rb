class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order(nome: :desc).limit 5
        @produto_com_desconto = Produto.order(:preco).limit 1
    end
    
    def create
        produto = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
        Produto.create produto
        redirect_to root_url
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
    
    
end
