# php des test
# https://blog.zhengxianjun.com/online-tool/crypto/des/

require 'openssl'
require 'base64'

key = "0123456789abcdef"
iv = "0123456789abcdef"

def des_encrypt(str, key, iv, mode = 'DES-CBC')  
  cipher = OpenSSL::Cipher::Cipher.new(mode)
  cipher.encrypt
  cipher.key = key
  cipher.iv = iv
  result = cipher.update(str)
  result << cipher.final

  Base64.encode64(result) 
end

def des_decrypt(str, key, iv, mode = 'DES-CBC')
  str = Base64.decode64(str) 

  cipher = OpenSSL::Cipher::Cipher.new(mode)
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv
  result = cipher.update(str)
  result << cipher.final
end

p des_encrypt('wikimo', key, iv)

p des_decrypt('07QMkJQeQfQ=', key, iv)