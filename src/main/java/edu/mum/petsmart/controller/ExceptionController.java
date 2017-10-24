package edu.mum.petsmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.validation.FieldError;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;

import edu.mum.petsmart.dto.DomainError;
import edu.mum.petsmart.dto.DomainErrors;
 
@ControllerAdvice
public class ExceptionController {


	@Autowired
	MessageSourceAccessor messageAccessor;
	
	@ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public DomainErrors handleException(Exception exception) {
        DomainErrors errors = new DomainErrors();
        if (MethodArgumentNotValidException.class.isInstance(exception)) {
            List<FieldError> fieldErrors = ((MethodArgumentNotValidException)exception)
            							.getBindingResult().getFieldErrors();
            
            errors.setErrorType("ValidationError");
            for (FieldError fieldError : fieldErrors) {
             	DomainError error = new DomainError( messageAccessor.getMessage(fieldError));
                           errors.addError(error);            }
                     	
        } else {
        
	        Throwable e = exception;
	        if (exception.getCause() != null) {
	             e = exception.getCause();
	        } 
	
	        if (InvalidFormatException.class.isInstance(e)) {
	        	InvalidFormatException i = (InvalidFormatException)e;
	        	String message = i.getValue() + " is invalid format";
	        	errors.setErrorType(message);
	        } else {
	            errors.setErrorType(e.getMessage());
	        }
        }
        return errors;
    }

}