DELIMITER $$

DROP PROCEDURE IF EXISTS `cw`.`sub_vote` $$
CREATE DEFINER=`root`@`%` PROCEDURE `sub_vote`(IN articleId INTEGER(10), IN vCategory VARCHAR(20), IN avgNum FLOAT, IN draw INTEGER(1))

BEGIN
        DECLARE mbId int(10);       /* memberId */
        DECLARE voteNum int(10);    /* vote number */
        DECLARE p_integer int(10);/* the integer part of privilege */
        DECLARE p_decimal int(5);/* the dcimal part of privilege */
        DECLARE m_p_integer int(10);
        DECLARE m_p_decimal int(5);
        DECLARE win_voteNum float;
        
        
        DECLARE done INT DEFAULT 0;


        DECLARE CUR CURSOR FOR SELECT MemberId,VoteNumber FROM cw.vote
        WHERE ResourceId = articleId AND VoteCategory = vCategory AND
        ResourceType = 'Article';
        
        DECLARE CUR2 CURSOR FOR SELECT MemberId,VoteNumber FROM cw.vote
        WHERE ResourceId = articleId AND ResourceType = 'Article';

        DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
        IF NOT draw THEN
        OPEN CUR;
        REPEAT
              FETCH CUR INTO mbId,voteNum;
              IF NOT done THEN
              
                 SET win_voteNum = voteNum * avgNum;
                 SET p_integer = TRUNCATE(win_voteNum,0); /* get the integer part*/
                 SET p_decimal = TRUNCATE((win_voteNum - p_integer)*1000,0);/* get the decimal part */
                 SELECT Privilege,PrivilegeDecimalValue INTO m_p_integer,m_p_decimal FROM member WHERE Id = mbId;
                 
                 IF m_p_decimal + p_decimal >= 1000 THEN
                    SELECT 'MORE THEN 1000';
                    SET m_p_integer = m_p_integer + p_integer + 1;
                    SET m_p_decimal = m_p_decimal + p_decimal - 1000;
                    SELECT m_p_integer,m_p_decimal;
                 ELSE
                    SELECT 'LESS THEN 1000';
                    SET m_p_integer = m_p_integer + p_integer ;
                    SET m_p_decimal = m_p_decimal + p_decimal ;
                    SELECT m_p_integer,m_p_decimal;
                 END IF;
                 UPDATE member SET Privilege = m_p_integer,PrivilegeDecimalValue = m_p_decimal
                 WHERE Id = mbId;
                 
              END IF;
        UNTIL done END REPEAT;
        CLOSE CUR;
        ELSE
        OPEN CUR2;
        REPEAT
              FETCH CUR2 INTO mbId,voteNum;
              IF NOT done THEN
              UPDATE cw.member SET Privilege = Privilege + voteNum WHERE Id = mbId;

              END IF;
        UNTIL done END REPEAT;
        CLOSE CUR2;
        END IF;
END $$

DELIMITER ;