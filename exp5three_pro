DELIMITER //

CREATE PROCEDURE member_status(IN cid INT, OUT membership VARCHAR(20))
BEGIN
   DECLARE cred INT;

   SELECT credits INTO cred
   FROM customer
   WHERE customer_id = cid;

   IF cred > 5000 THEN
      SET membership = 'platinum';
   ELSEIF cred >= 1000 AND cred <= 5000 THEN
      SET membership = 'gold';
   ELSE
      SET membership = 'silver';
   END IF;

END //

DELIMITER ;
