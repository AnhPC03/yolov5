export PYTHONPATH="$PWD"

INPUT_SIZE=640
MODEL_NAME=yolov5s

python export.py \
       --weights weights/pt/${MODEL_NAME}.pt \
       --img-size ${INPUT_SIZE} \
       --batch-size 1 \
       --out-dir weights/onnx

mnnconvert -f ONNX \
       --modelFile weights/onnx/${MODEL_NAME}.onnx \
       --MNNModel weights/mnn/${MODEL_NAME}.mnn \
       --bizCode MNN \
       --weightQuantBits 8
echo "Convert successfully. Your MNN model is in weights/mnn/${MODEL_NAME}.mnn"
