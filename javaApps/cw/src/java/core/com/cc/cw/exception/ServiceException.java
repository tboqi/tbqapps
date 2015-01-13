package com.cc.cw.exception;


/**
 * 
 *
 * @author <a href="mailto:xiat@ruc.edu.cn">Gavin XIA</a>
 * @version 1.0
 * @date 2006-5-15 18:21:42
 */
public class ServiceException extends BaseException {
	private static final long serialVersionUID = 4173717261611887313L;

    public ServiceException() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @param message
     */
    public ServiceException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }
    /**
     * @param message
     * @param cause
     */
    public ServiceException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }
    /**
     * @param cause
     */
    public ServiceException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }
}
