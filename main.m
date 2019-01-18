% Andrea Silvestroni 2019
% Residual Noise Extraction and Smartphone Linking
%
% Main function of the wrapper (target this in the compiler)
function main(filename, outfile, resize)

    if nargin == 3
        if numel(logical(resize)) == 1
            resize = logical(resize);
        else
            resize = 0;
        end
    elseif nargin == 2
        resize = 0;
    elseif nargin == 1
        resize = 0;
        outfile = strrep(filename, ".mat", ".noise.mat");
    elseif nargin == 0
        error("An input file is mandatory")
    end

    if ~isfile(filename)
        error('%s does not exist', filename)
    end

    prep=load(filename);
    pic = prep.pic;

    [~, out]=BM3D(1, pic, 4);

    if is_int(pic)
        pic = im2double(pic);
    end

    rn=pic-out;

    if resize
        rn = imresize(rn, [1024, 1024]);
    end
    save(outfile, "rn");

    function res = is_int(x)
        res = all(reshape(isfinite(x)&floor(x)==x, 1, []));
    end
    
end