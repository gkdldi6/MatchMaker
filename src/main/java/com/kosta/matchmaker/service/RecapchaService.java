package com.kosta.matchmaker.service;

import net.tanesha.recaptcha.ReCaptchaResponse;

public interface RecapchaService {
	
	public ReCaptchaResponse reCaptchaResonpse (String host, String challeng, String res);
}
