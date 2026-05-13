INSERT INTO quanlybanhang.customer
(cID, cName, cAge)
VALUES(0, 'Minh Quan', 10),(0,'Ngoc Oanh',20),(0,'Hong Ha',50);

INSERT INTO quanlybanhang.`order`
(oID, cID, oDate, oTotalPrice)
VALUES(0, 1, '2006-03-21', null),
(0, 2, '2006-03-23', null),
(0, 1, '2006-03-16', null);;

INSERT INTO quanlybanhang.product
(pID, pName, pPrice)
VALUES
(0, 'May Giat', 3),(0, 'Tu Lanh', 5),(0, 'Dieu Hoa', 7),(0, 'Quat', 1),(0, 'Bep Dien', 2);

INSERT INTO quanlybanhang.orderdetail
(oID, pID, odQTY)
VALUES
(1, 1, 3),(1, 3, 7),(1, 4, 2),(2, 1, 1),(3, 1, 8),(2, 5, 4),(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o.oID , o.oDate , o.oTotalPrice  FROM `order` o ;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cName, p.pName,od.odQTY, o.oDate  FROM customer c JOIN `order` o ON c.cID = o.cID JOIN orderdetail od ON o.oID = od.oID JOIN product p ON od.pID = p.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT *  FROM customer c LEFT JOIN `order` o ON c.cID = o.cID WHERE oID IS NULL ;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.oID, o.oDate , SUM(od.odQTY * p.pPrice) AS Totalprice FROM `order` o JOIN orderdetail od  ON o.oID = od.oID JOIN product p ON od.pID = p.pID GROUP BY o.oID ;
 
 
 
 