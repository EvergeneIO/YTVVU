const path = require('path');

/* module.exports = {
    entry: {
        auth: './src/auth.ts'
    },
    watch: true,
    devtool: 'inline-source-map',
    module: {
        rules: [
            {

                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
            {
                test: /\.(jpg|png)$/,
                use: {
                    loader: 'url-loader',
                },
            },
        ],
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js'],
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'public/js'),
    },
};
 */
module.exports = {
    mode: "development", //production
    entry: {
        auth: './src/auth.ts',
        images: [
            './src/assets/logo.png',
            './src/assets/favicon.png'
        ]
    },
    module: {
        rules: [
            {
                test: /\.ts$/,
                include: [path.resolve(__dirname, 'src')],
                use: 'ts-loader',
                //outputPath: 'js'
            },
            {
                test: /\.(png|svg|jpg|jpeg|gif)$/i,
                type: 'asset/resource',
                loader: 'file-loader',
                options: {
                    name: '[name].[ext]',
                    outputPath: 'images'
                }
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js'],
    },
    devtool: 'eval-source-map',
    output: {
        publicPath: 'public',
        filename: 'js/[name].bundle.js',
        path: path.resolve(__dirname, 'public'),
        clean: true
    },
};