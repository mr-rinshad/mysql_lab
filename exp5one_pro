DELIMITER //

CREATE PROCEDURE withdraw(IN p_acc_id INT, IN amt INT)
BEGIN
    DECLARE bal INT;

    SELECT balance INTO bal
    FROM account
    WHERE acc_id = p_acc_id;

    IF bal IS NULL THEN
        SELECT 'Account does not exist' AS message;

    ELSEIF (bal - amt) < 1000 THEN
        SELECT 'Withdraw not allowed, minimum balance must be 1000' AS message;

    ELSE
        UPDATE account
        SET balance = balance - amt
        WHERE acc_id = p_acc_id;

        SELECT 'Withdraw successful' AS message;
    END IF;

END //

DELIMITER ;
