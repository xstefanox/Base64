
if window?
    
    # @namespace Base64 encoding/decoding namespace.
    # 
    # @see http://www.webtoolkit.info/javascript-base64.html
    window.Base64 = {}

    # @static
    # @description ASCII characters to Base64 translation table.
    Base64.key = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
    
    # Encode the given data to Base64.
    #
    # @param input The data tha must be encoded.
    # @returns The given data encoded in a Base64 string.
    Base64.encode = (input) ->
    
        # final output string
        output = ''
        
        # input charaters: chr1, chr2, chr3
        # output characters: enc1, enc2, enc3, enc4
        
        # loop counter
        i = 0

        # encode the input in UTF-8
        input = unescape(encodeURIComponent(input))

        while i < input.length

            chr1 = input.charCodeAt(i)
            i += 1
        
            chr2 = input.charCodeAt(i)
            i += 1
        
            chr3 = input.charCodeAt(i)
            i += 1

            enc1 = chr1 >> 2
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4)
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6)
            enc4 = chr3 & 63

            if isNaN(chr2)
                enc3 = enc4 = 64
            else if isNaN(chr3)
                enc4 = 64

            output = output +
                Base64.key.charAt(enc1) + Base64.key.charAt(enc2) +
                Base64.key.charAt(enc3) + Base64.key.charAt(enc4)

        return output

        # Decode the given string from Base64 back to its original value.
        #
        # @param input The Base64 encoded string.
        # @returns The original data.
        Base64.decode = (input) ->
            
            # final output string
            output = ''
        
            # input charaters: enc1, enc2, enc3, enc4
            # output characters: chr1, chr2, chr3
        
            # loop counter
            i = 0

            input = input.replace(/[^A-Za-z0-9\+\/\=]/g, '')

            while i < input.length

                enc1 = Base64.key.indexOf(input.charAt(i))
                i += 1
        
                enc2 = Base64.key.indexOf(input.charAt(i))
                i += 1
        
                enc3 = Base64.key.indexOf(input.charAt(i))
                i += 1
        
                enc4 = Base64.key.indexOf(input.charAt(i))
                i += 1
        
                chr1 = (enc1 << 2) | (enc2 >> 4)
                chr2 = ((enc2 & 15) << 4) | (enc3 >> 2)
                chr3 = ((enc3 & 3) << 6) | enc4

                output = output + String.fromCharCode(chr1)

                if enc3 isnt 64
                    output = output + String.fromCharCode(chr2)
                
                if enc4 isnt 64
                    output = output + String.fromCharCode(chr3)

            # decode the output from UTF-8
            output = decodeURIComponent(escape(output))

            return output
            