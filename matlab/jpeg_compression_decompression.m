AB=imread('cameraman.tif');
A = cast(AB,'double');
Q=[16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99 ];

X=mat2cell(A,[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]);

Huffman = [10 0 1 4 11 26 120 248 1014 65410 65411;
             10 12 27 121 502 2038 65412 65413 65414 65415 65416;
             10 28 249 1015 4084 65417 65418 65419 65420 65421 65422;
             10 58 503 4085 65423 65424 65425 65426 65427 65428 65429;
             10 59 1016 65430 65431 65432 65433 65434 65435 65436 65437;
             10 122 2039 65438 65439 65440 65441 65442 65443 65444 65445;
             10 123 4086 65446 65447 65448 65449 65450 65451 65452 65453;
             10 250 4087 65454 65455 65456 65457 65458 65459 65460 65461;
             10 504 32704 65462 65463 65464 65465 65466 65467 65468 65469;
             10 505 65470 65471 65472 65473 65474 65475 65476 65477 65478;
             10 506 65479 65480 65481 65482 65483 65484 65485 65486 65487;
             10 1017 65488 65489 65490 65491 65492 65493 65494 65495 65496;
             10 1018 65497 65498 65499 65500 65501 65502 65503 65504 65505;
             10 2040 65506 65507 65508 65509 65510 65511 65512 65513 65514;
             10 65515 65516 65517 65518 65519 65520 65521 65522 65523 65524;
             2041 65525 65526 65527 65528 65529 65530 65531 65532 65533 65534];


QF=input('prompt');
if QF<50
    S=5000/QF;
else
    S=200-2*QF;
end

T=floor((S*Q)+50)/100;
T(T==0)=1;

%////////////////////////   DCT 2D  ///////////////////////////////
for i=1:32
    for j=1:32
       X{i,j}=dct2(X{i,j});
    end
end


%////////////////////////   Quantization    //////////////////////
for i=1:32
    for j=1:32
        X{i,j}=round(X{i,j}./T);
    end
end

%////////////////////////   Zigzaging   ////////////////////////// 
ZigZag = [];
indexMat = [ 1 2 9 17 10 3 4 11 18 25 33 26 19 12 5 6 13 20 27 34 41 49 42 35 28 21 14 7 8 15 22 29 36 43 50 57 58 51 44 37 30 23 16 24 31 38 45 52 59 60 53 46 39 32 40 47 54 61 62 55 48 56 63 64];

for i=1:32
    for j=1:32
        
        block=X{i,j};
        tempZigZag = [];

        for k=1:8
           tempZigZag = [tempZigZag block(k,:)]; 
        end

        for k=1:64
            ZigZag = [ZigZag tempZigZag(indexMat(k))];
        end       

    end
end




%/////////////////////// Zero Run Lenght Encoding with BitSize ///////////////////

Y = mat2cell(ZigZag, [1],  64.*ones(1, 1024));

ZRLE = [];

for i=1:1024

    block = Y{i};
  
        counter = 0;
        bitSize = 0;
       
        for j=1:64

                if block(j)==0 && counter<15 
                    
                      if j==64
                          ZRLE = [ZRLE, 0, 0, 0];
                      else
                           counter= counter+1;
                      end

                else
                        
                        if abs(block(j))==0
                            bitSize =0;
                        elseif abs(block(j))==1
                            bitSize =1;
                        elseif abs(block(j))>=2 && abs(block(j))<=3
                            bitSize =2;
                        elseif abs(block(j))>=4 && abs(block(j))<=7
                            bitSize =3;
                        elseif abs(block(j))>=8 && abs(block(j))<=15
                            bitSize =4;
                        elseif abs(block(j))>=16 && abs(block(j))<=31
                            bitSize =5;
                        elseif abs(block(j))>=32 && abs(block(j))<=63
                            bitSize =6;
                        elseif abs(block(j))>=64 && abs(block(j))<=127
                           bitSize =7;
                        elseif abs(block(j))>=128 && abs(block(j))<=255
                            bitSize =8;
                        elseif abs(block(j))>=256 && abs(block(j))<=511
                            bitSize =9;
                        else
                            bitSize =10;
                        end
                        
                        ZRLE = [ZRLE, counter, bitSize, block(j)];
                        counter=0;
                end
       end             

end
%}

%---------------------  Entropy Encoding    ---------
EE = [];
j=1;     
for i = 1:3:length(ZRLE)
    
    r = ZRLE(i)+1;
    counter = ZRLE(i+1)+1; 
 
    EE(j) = Huffman(r,counter);
    EE(j+1) = typecast((int8(ZRLE(i+2))),'uint8');
    j = j+2;
end



%---------Generate file  ----------
fid1= fopen('G:\Compresion_ImageFile.txt','wt');
for i = 1:length(EE)
      fprintf(fid1,'%g',EE(i));
end     
fclose(fid1);

%}


%----------------   Entropy Decoding    ---------------
j = 1;
counter = 0;
IEE = [];
for i = 1:2:length(EE)   
     
    for ii = 1:16
        for jj = 1:11
            if(Huffman(ii,jj) == EE(i))
                r = ii;
                counter = jj;
            end
        end
    end
    
    IEE(j) = r - 1;
    IEE(j+1) = counter - 1;
    IEE(j+2) = typecast((uint8(EE(i+1))),'int8');
    
     
    if(IEE(j) == 14 && IEE(j+1) == 0)
        IEE(j) = 64-counter-1;
        %counter = 64;
    end
    
    counter = counter + IEE(j) + 1;
    if(counter == 64)
        counter = 0;
    end
        j = j + 3;

end



%////////////////////////    Zero run length Decoding With bitsize.    ////////////////////
 
   IZRLE = [];
   count = 0;
   for i=1:length(IEE)
       
       
         if(mod(i,3)==0)
           IZRLE = [IZRLE IEE(i)];
    %       count = count + 1;

       elseif(mod(i,3)==1)
         for j=1:IEE(i)
            IZRLE = [IZRLE 0];   
         end
        end    
   end
%}



%///////////// Inverse zigzagging/////////////////
IZigZag=mat2cell( zeros(256,256) ,[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8],[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]);
k=0;

Y = mat2cell(ZigZag, [1],  64.*ones(1, 1024));
tempRow = [];
for i=1:32
    for j=1:32
        k = k+1;
        block = Y{1,k};
      
        for l=1:64
            tempRow(indexMat(l)) = block(l);
        end
        
        uzz = [tempRow(1:8); tempRow(9:16); tempRow(17:24); tempRow(25:32); tempRow(33:40); tempRow(41:48); tempRow(49:56); tempRow(57:64)];
        IZigZag{i,j} = uzz;
    end
end

% DeQuantization
for i=1:32
    for j=1:32
        IZigZag{i,j}=IZigZag{i,j}.*T;
    end
end

%///////////////////////////////    Inverse  DCT    //////////////////////
for i=1:32
    for j=1:32
       IZigZag{i,j}=idct2(IZigZag{i,j});
    end
end

ProcessedImage = cell2mat(IZigZag);
ProcessedImage=uint8(ProcessedImage);      

figure;
subplot(1,2,1),
imshow(AB),
xlabel('Original Image');

subplot(1,2,2),
imshow(ProcessedImage),
xlabel('Output Image');




%}
