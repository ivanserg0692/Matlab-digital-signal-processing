function x = myIFFT(y)
N = length(y);

%прореживание по времени
countsubArray = 1;
len_subArray = N;
arr = y;
while (len_subArray ~= 1)
    len_ =  len_subArray/ 2;
    count_ = countsubArray *2;
    n = 1:1: len_;
    ofs = 0;
    for( numSubArr = 0:count_-1)
        if(rem(numSubArr,2)==0)
            arr(numSubArr*len_ + n) = y(ofs +n*2-1);
        else
            arr(numSubArr*len_ + n) = y(ofs +n*2);
            ofs = len_*2 +ofs;
        end
    end
    y = arr;
    len_subArray = len_;
    countsubArray = count_;
end
%одноточные спектры объединяем
while(len_subArray ~= N)
    len_ = len_subArray * 2;
    count_ = countsubArray/2;
    for(nSubArr = 0:1:count_-1)
        for(nel = 1:len_subArray)
            arr(nSubArr*len_ + nel) = y(nSubArr*len_ + nel) + y(nSubArr*len_ + nel + len_subArray)*w(-(nel-1),len_);
            arr(nSubArr*len_ + nel + len_subArray) = y(nSubArr*len_ + nel) - y(nSubArr*len_ + nel + len_subArray)*w(-(nel-1),len_);
        end
    end
    y = arr;
    len_subArray = len_;
    countsubArray = count_;
end

x = y/N;
