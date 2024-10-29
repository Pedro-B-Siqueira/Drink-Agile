drop procedure if exists proc_realizar_venda;
delimiter //
create procedure proc_realizar_venda(
    in p_id_produto int,
    in p_id_cliente int,
    in p_id_funcionario int,
    in p_qtd_produto int
)
begin
    if exists (select 1 from produtos where id_produto = p_id_produto) then
        if exists (select 1 from clientes where id_cliente = p_id_cliente) then
            if exists (select 1 from funcionarios where id_funcionario = p_id_funcionario) then
                if ((select qtd_produto_disponivel from produtos where id_produto = p_id_produto) > p_qtd_produto) then
                    insert into vendas(fk_id_produto, fk_id_cliente, fk_id_funcionario, preco_produto, qtd_produto, preco_final, data_venda) 
                
                    values (p_id_produto, p_id_cliente, p_id_funcionario, (select preco_produto from produtos where id_produto = p_id_produto), 
                            p_qtd_produto, (p_qtd_produto * (select preco_produto from produtos where id_produto = p_id_produto)),
                            now());
                    
                    update produtos set qtd_produto_disponivel = qtd_produto_disponivel - p_qtd_produto
                                where id_produto = p_id_produto;
                                
                    select 'Venda realizada com sucesso!' as mensagem;
                else
                    select 'Quantidade dísponivel menor que a solicitada!' as mensagem;
                end if;
            else
                select 'Este FUNCIONÁRIO NÃO EXISTE no nosso sistema.' as mensagem;
            end if;
        else
            select 'Este CLIENTE NÃO EXISTE no nosso sistema.' as mensagem;
        end if;
    else
        select 'Este PRODUTO NÃO EXISTE no nosso sistema.' as mensagem;
    end if;
        
    
end //
delimiter ;